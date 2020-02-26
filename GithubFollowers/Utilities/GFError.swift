//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 1/8/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername = "Username created an invalid request. Please try again."
    case unableToComplete = "There was an error processing your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error adding user to favorites. Please try again."
    case alreadyInFavorites = "You've already added this user to favorites."
}
