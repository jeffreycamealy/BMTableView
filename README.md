BMTableView
===========

__Goal__: To develop a `UITableView` replacement that will be based on Auto Layout.


## Current Functionality

- Table view cell height will be calculated for you automatically.  No more `heightForRowAtIndexPath:`!
- If you animate the height change of one of your table view cells, the table view will animate the other cells 
to fill in automatically.


## Usage

Implement `BMTableView`s delegate methods: 
- `numberOfRowsInSection:` 
- `cellForRowAtIndexPath:`

In your custom subclass of `BMTableViewCell` set its size using Auto Layout.  See an example below (constraints are 
set using [Masonry](https://github.com/cloudkite/Masonry) framework).

```
- (id)init {
    if (self = [super init]) {
        label = UILabel.new;
        [self addSubview:label];
        label.numberOfLines = 0; // Label will be a variable height
        label.preferredMaxLayoutWidth = 280;
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top);
            make.left.equalTo(self.left);
        }];
        
        [self makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(label.bottom);
        }];
    }
    return self;
}
```

## Roadmap

This Framework is still in early development and is not yet ready for shipping applications.  That being said, we are 
quickly working to fill out the rest of the standard features from `UITableView`.  The main challenges remaining are:
- Table view cell reuse
- Partial table view loading (i.e. Only load the first 10 cells of a 100 cell tableview, then add more 
cells as the user scrolls)
