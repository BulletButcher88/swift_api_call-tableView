//
//  Post.swift
//  API_Request
//
//  Created by Mark Butcher on 5/12/20.
//
import Foundation

struct MyResult: Decodable {
    let id: String?
    let author: String?
    let width: Int?
    let height: Int?
    let url: String?
    let download_url: String?
}
