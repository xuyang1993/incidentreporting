//
//  IQBarButtonItem.swift
// https://github.com/hackiftekhar/IQKeyboardManager
// Copyright (c) 2013-16 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

open class IQBarButtonItem: UIBarButtonItem {

    private static var _classInitialize: Void = classInitialize()
    
    public override init() {
        _ = IQBarButtonItem._classInitialize
          super.init()
      }

    public required init?(coder aDecoder: NSCoder) {
        _ = IQBarButtonItem._classInitialize
           super.init(coder: aDecoder)
       }

   
    private class func classInitialize() {

        //Tint color
        self.appearance().tintColor = nil

        //Title
        self.appearance().setTitlePositionAdjustment(UIOffset.zero, for: UIBarMetrics.default)
        self.appearance().setTitleTextAttributes(nil, for: UIControlState())
        self.appearance().setTitleTextAttributes(nil, for: UIControlState.highlighted)
        self.appearance().setTitleTextAttributes(nil, for: UIControlState.disabled)
        self.appearance().setTitleTextAttributes(nil, for: UIControlState.selected)
        self.appearance().setTitleTextAttributes(nil, for: UIControlState.application)
        self.appearance().setTitleTextAttributes(nil, for: UIControlState.reserved)

        //Background Image
        self.appearance().setBackgroundImage(nil, for: UIControlState(),      barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.highlighted, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.disabled,    barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.selected,    barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.application, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.reserved,    barMetrics: UIBarMetrics.default)
        
        self.appearance().setBackgroundImage(nil, for: UIControlState(),      style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.highlighted, style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.disabled,    style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.selected,    style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.application, style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.reserved,    style: UIBarButtonItemStyle.done, barMetrics: UIBarMetrics.default)
        
        self.appearance().setBackgroundImage(nil, for: UIControlState(),      style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.highlighted, style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.disabled,    style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.selected,    style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.application, style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundImage(nil, for: UIControlState.reserved,    style: UIBarButtonItemStyle.plain, barMetrics: UIBarMetrics.default)
        self.appearance().setBackgroundVerticalPositionAdjustment(0, for: UIBarMetrics.default)

        //Back Button
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState(),      barMetrics: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState.highlighted, barMetrics: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState.disabled,    barMetrics: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState.selected,    barMetrics: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState.application, barMetrics: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundImage(nil, for: UIControlState.reserved,    barMetrics: UIBarMetrics.default)

        self.appearance().setBackButtonTitlePositionAdjustment(UIOffset.zero, for: UIBarMetrics.default)
        self.appearance().setBackButtonBackgroundVerticalPositionAdjustment(0, for: UIBarMetrics.default)
    }

    /**
     Boolean to know if it's a system item or custom item, we are having a limitation that we cannot override a designated initializer, so we are manually setting this property once in initialization
     */
    var isSystemItem = false
    
//    public override init(barButtonSystemItem systemItem: UIBarButtonSystemItem, target: Any?, action: Selector?) {
//        return super.init(barButtonSystemItem: systemItem, target: target, action: action)
//    }

    /**
     Additional target & action to do get callback action. Note that setting custom target & selector doesn't affect native functionality, this is just an additional target to get a callback.
     
     @param target Target object.
     @param action Target Selector.
     */
    open func setTarget(_ target: AnyObject?, action: Selector?) {
        invocation = (target, action)
    }
    
    /**
     Customized Invocation to be called when button is pressed. invocation is internally created using setTarget:action: method.
     */
    open var invocation : (target: AnyObject?, action: Selector?)
    
}
