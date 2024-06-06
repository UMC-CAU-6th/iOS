//
//  File.swift
//  DoughnutStore
//
//  Created by 황유빈 on 6/6/24.
//

import Foundation

struct LocationInfo: Decodable {
    let status: Status
    let results: [Result]
    
    struct Status: Decodable {
        let code: Int
        let name: String
        let message: String
    }
    
    struct Result: Decodable {
        let name: String
        let code: Code
        let region: Region
        
        struct Code: Decodable {
            let id: String
            let type: String
            let mappingId: String
        }
        
        struct Region: Decodable {
            let area0: Area
            let area1: Area
            let area2: Area
            let area3: Area
            let area4: Area
            
            struct Area: Decodable {
                let name: String
                let coords: Coords
                
                struct Coords: Decodable {
                    let center: Center
                    
                    struct Center: Decodable {
                        let crs: String
                        let x: Double
                        let y: Double
                    }
                }
            }
        }
    }
}
