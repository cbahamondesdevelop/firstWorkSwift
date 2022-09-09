//
//  NSLayoutConstraint.swift
//  firstApp
//
//  Created by sebastian.diaz.avila on 09-09-22.
//

import Foundation
import UIKit

extension NSLayoutConstraint {

    public static func inset(view: UIView,
                             inSuperview superView: UIView,
                             withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [.top(firstItem: superView, secondItem: view, constant: -(inset?.top ?? 0)),
                .left(firstItem: superView, secondItem: view, constant: -(inset?.left ?? 0)),
                .right(firstItem: superView, secondItem: view, constant: inset?.right ?? 0),
                .bottom(firstItem: superView, secondItem: view, constant: inset?.bottom ?? 0)]
    }

    /// Setup contratint related to safeArea
    /// - Parameters:
    ///   - view: view used to setup constraints
    ///   - superView: superview where view is added
    ///   - inset: used to setup the distance of each direction
    public static func safeAreaInset(view: UIView,
                                     inSuperview superView: UIView,
                                     withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [.safeAreaTop(safeAreaItem: superView, otherItem: view, constant: inset?.top ?? 0),
                .safeAreaLeft(safeAreaItem: superView, otherItem: view, constant: -(inset?.left ?? 0)),
                .safeAreaRight(safeAreaItem: superView, otherItem: view, constant: inset?.right ?? 0),
                .safeAreaBottom(safeAreaItem: superView, otherItem: view, constant: inset?.bottom ?? 0)]
    }

    /// Setup top constraint related to safeArea
    /// - Parameters:
    ///   - safeAreaItem: parent view
    ///   - otherItem: target view
    ///   - constant: layout constant
    public static func safeAreaTop(safeAreaItem: UIView, otherItem: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return otherItem.topAnchor.constraint(equalTo: safeAreaItem.safeAreaLayoutGuide.topAnchor, constant: constant)
        } else {
            return top(firstItem: safeAreaItem, secondItem: otherItem, constant: constant)
        }
    }

    /// Setup bottom constraint related to safeArea
    /// - Parameters:
    ///   - safeAreaItem: parent view
    ///   - otherItem: target view
    ///   - constant: layout constant
    public static func safeAreaBottom(safeAreaItem: UIView, otherItem: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return otherItem.bottomAnchor.constraint(equalTo: safeAreaItem.safeAreaLayoutGuide.bottomAnchor, constant: constant * -1)
        } else {
            return bottom(firstItem: safeAreaItem, secondItem: otherItem, constant: constant)
        }
    }

    /// Setup left constraint related to safeArea
    /// - Parameters:
    ///   - safeAreaItem: parent view
    ///   - otherItem: target view
    ///   - constant: layout constant
    public static func safeAreaLeft(safeAreaItem: UIView, otherItem: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return safeAreaItem.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: otherItem.leftAnchor, constant: constant)
        } else {
            return left(firstItem: otherItem, secondItem: safeAreaItem, constant: constant)
        }
    }

    /// Setup right constraint related to safeArea
    /// - Parameters:
    ///   - safeAreaItem: parent view
    ///   - otherItem: target view
    ///   - constant: layout constant
    public static func safeAreaRight(safeAreaItem: UIView, otherItem: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
        if #available(iOS 11.0, *) {
            return safeAreaItem.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: otherItem.rightAnchor, constant: constant)
        } else {
            return bottom(firstItem: safeAreaItem, secondItem: otherItem, constant: constant)
        }
    }

    /// Create an instance of NSLayoutConstraint (top)
    ///
    /// - Parameters:
    ///   - firstItem: target view
    ///   - secondItem: parent view
    ///   - constant: layout constant
    ///   - multiplier: multiplier
    ///   - relatedBy: relationship
    /// - Returns: a instance of NSLayoutConstraint
    public static func top(firstItem: UIView,
                           secondItem: UIView,
                           constant: CGFloat = 0,
                           multiplier: CGFloat = 1,
                           relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      relatedBy: relatedBy,
                                      toItem: secondItem,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      multiplier: multiplier,
                                      constant: constant)
    }
    
    /// Create an instance of NSLayoutConstraint (left)
    ///
    /// - Parameters:
    ///   - firstItem: target view
    ///   - secondItem: parent view
    ///   - constant: layout constant
    ///   - multiplier: multiplier
    ///   - relatedBy: relationship
    /// - Returns: a instance of NSLayoutConstraint
    public static func left(firstItem: UIView,
                            secondItem: UIView,
                            constant: CGFloat = 0,
                            multiplier: CGFloat = 1,
                            relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      relatedBy: relatedBy,
                                      toItem: secondItem,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      multiplier: multiplier,
                                      constant: constant)
    }
    
    /// Create an instance of NSLayoutConstraint (right)
    ///
    /// - Parameters:
    ///   - firstItem: parent view
    ///   - secondItem: target view
    ///   - constant: layout constant
    ///   - multiplier: multiplier
    ///   - relatedBy: relationship
    /// - Returns: a instance of NSLayoutConstraint
    public static func right(firstItem: UIView,
                             secondItem: UIView,
                             constant: CGFloat = 0,
                             multiplier: CGFloat = 1,
                             relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      relatedBy: relatedBy,
                                      toItem: secondItem,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      multiplier: multiplier,
                                      constant: constant)
    }
    
    /// Create an instance of NSLayoutConstraint (bottom)
    ///
    /// - Parameters:
    ///   - firstItem: parent view
    ///   - secondItem: target view
    ///   - constant: layout constant
    ///   - multiplier: multiplier
    ///   - relatedBy: relationship
    /// - Returns: a instance of NSLayoutConstraint
    public static func bottom(firstItem: UIView,
                              secondItem: UIView,
                              constant: CGFloat = 0,
                              multiplier: CGFloat = 1,
                              relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      relatedBy: relatedBy,
                                      toItem: secondItem,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      multiplier: multiplier,
                                      constant: constant)
    }
    
    public static func over(topItem: UIView,
                            bottomItem: UIView,
                            constant: CGFloat = 0,
                            multiplier: CGFloat = 1,
                            relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: topItem,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      relatedBy: relatedBy,
                                      toItem: bottomItem,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      multiplier: multiplier,
                                      constant: -1 * constant)
    }
    
    public static func aside(left: UIView,
                             right: UIView,
                             constant: CGFloat = 0,
                             multiplier: CGFloat = 1,
                             relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
            return NSLayoutConstraint(item: left,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      relatedBy: relatedBy,
                                      toItem: right,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      multiplier: multiplier,
                                      constant: -1 * constant)
    }
    
    public static func height(view: UIView,
                              constant: CGFloat,
                              multiplier: CGFloat = 1,
                              relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relatedBy,
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    public static func equalHeight(firstView: UIView,
                                   secondView: UIView,
                                   multiplier: CGFloat = 1,
                                   constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    public static func width(view: UIView,
                             constant: CGFloat,
                             multiplier: CGFloat = 1,
                             relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relatedBy,
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }

    public static func equalWidth(firstView: UIView,
                                  secondView: UIView,
                                  multiplier: CGFloat = 1,
                                  constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    /// Set aspect ratio for the view
    ///
    /// - Parameters:
    ///   - view: view to set the aspect ratio
    ///   - constant: width / height
    /// - Returns: A layou constraint defining the rule
    public static func aspectRadio(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: constant,
                                  constant: 0)
    }
    
    public static func verticalCenter(firstView: UIView, secondView: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.centerY,
                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.centerY,
                                      multiplier: 1,
                                      constant: constant)
    }
    
    public static func horizontalCenter(firstView: UIView, secondView: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                      multiplier: 1,
                                      constant: constant)
    }
}
// swiftlint:enable forbid_number_as_constant

// swiftlint:disable forbid_constraint_activation
extension Array where Element == NSLayoutConstraint {

    public static func inset(view: UIView,
                             inSuperview superView: UIView,
                             withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.inset(view: view, inSuperview: superView, withInset: inset)
    }

    public func active() {
        NSLayoutConstraint.activate(self)
    }
    
    public func deactive() {
        NSLayoutConstraint.deactivate(self)
    }
}
// swiftlint:enable forbid_constraint_activation
