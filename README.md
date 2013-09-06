BMTableView
===========

__Goal__: To develop a `UITableView` replacement that will be based on Auto Layout.


## Current Functionality

- Table View Cell height will be calculated for you automatically.  No more `heightForRowAtIndexPath:`!
- If you animate the height change of one of your table view cells, the table view will animate the other cells 
to fill in automatically.


## Usage

Implement `BMTableView`s delegate methods `numberOfRowsInSection:` and `cellForRowAtIndexPath:`.  In your custom subclass 
of `BMTableViewCell` set its size using Auto Layout. 
