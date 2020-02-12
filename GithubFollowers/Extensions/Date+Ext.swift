//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/12/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
