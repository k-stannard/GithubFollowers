//
//  PersistenceManager.swift
//  GithubFollowers
//
//  Created by Koty Stannard on 2/17/20.
//  Copyright © 2020 Koty Stannard. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static fileprivate let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completion: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavortes = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavortes.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    retrievedFavortes.append(favorite)
                case .remove:
                    retrievedFavortes.removeAll { $0.login == favorite.login }
                }
                
                completion(save(favorites: favorites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func retrieveFavorites(completion: (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites)  as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
