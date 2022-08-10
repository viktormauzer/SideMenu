//
//  Ext+String.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import Foundation

extension String {
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}
