//
//  BaseViewConfiguration.swift
//  firstApp
//
//  Created by sebastian.diaz.avila on 09-09-22.
//

import Foundation
import UIKit

public protocol BaseViewConfiguration {
    func buildViewHierarchy()
    func setupConstraints()
    func configureView()
}

public extension BaseViewConfiguration {
    func setupViewConfiguration() {
        self.buildViewHierarchy()
        self.setupConstraints()
        self.configureView()
    }
    
    func configureView() {
        // Default implementation
    }
}

public extension BaseViewConfiguration {
    var constantSteperHeight: CGFloat {
        return 23
    }

    var constant0: CGFloat {
        return 0.0
    }

    var constant1: CGFloat {
        return 1.0
    }

    var constant2: CGFloat {
        return 2.0
    }

    var constant4: CGFloat {
        return 4.0
    }

    var constant6: CGFloat {
        return 6.0
    }

    var constant8: CGFloat {
        return 8.0
    }

    var constant10: CGFloat {
        return 10.0
    }

    var constant12: CGFloat {
        return 12.0
    }

    var constant14: CGFloat {
        return 14.0
    }

    var constant16: CGFloat {
        return 16.0
    }

    var constant20: CGFloat {
        return 20.0
    }

    var constant24: CGFloat {
        return 24.0
    }
    
    var constant26: CGFloat {
        return 26.0
    }

    var constant28: CGFloat {
        return 28.0
    }
    
    var constant30: CGFloat {
        return 30.0
    }

    var constant32: CGFloat {
        return 32.0
    }
    
    var constant34: CGFloat {
        return 34.0
    }

    var constant36: CGFloat {
        return 36.0
    }
    
    var constant38: CGFloat {
        return 38.0
    }

    var constant40: CGFloat {
        return 40.0
    }
    
    var constant42: CGFloat {
        return 42.0
    }

    var constant44: CGFloat {
        return 44.0
    }

    var constant48: CGFloat {
        return 48.0
    }

    var constant52: CGFloat {
        return 52.0
    }
    
    var constant54: CGFloat {
        return 54.0
    }

    var constant56: CGFloat {
        return 56.0
    }

    var constant60: CGFloat {
        return 60.0
    }

    var constant64: CGFloat {
        return 64.0
    }
    
    var constant128: CGFloat {
        return 128.0
    }
    
    var constant280: CGFloat {
        return 280.0
    }
}

// MARK: - UIView extension to falicitate the build of a constraints list
public extension UIView {
    
    /// Method to setup a list of constraints to self UIView
    ///
    /// - Parameter activate: Block that provide the constraints list to be activated, that uses self as parameter
    func setupConstraints(_ activate: (UIView) -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(activate(self)) // swiftlint:disable:this forbid_constraint_activation
    }
}
