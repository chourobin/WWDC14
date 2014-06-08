// Playground - noun: a place where people can play

import UIKit

// 1. Dynamic type comes with built-in labels
// 2. Custom fonts can use preferred font
UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

// Now everthing is dynamic
// Strategies
// 1. Use rowHeight
// 2. Delegate tableView: heightForRowAtIndexPath:
// 3. Self sizing cells

// 1. Add constraints to cell.contentView

// 2. Set font to preferredFontForTextStyel
var label = UILabel()
label.numberOfLines = 0
label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

// 3. Add constraints
var constraints = NSMutableArray.array()

// Manual constraint
//constraints.addObject(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.FirstBaseline, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.8, constant: 30))

// Visual format
constraints.addObject(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[label]-15-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["label": label]))

var tableView = UITableView()
tableView.estimatedRowHeight = 44;
tableView.rowHeight = UITableViewAutomaticDimension // gotcha
