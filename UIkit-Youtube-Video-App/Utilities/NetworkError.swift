//
//  NetworkError.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 09/12/21.
//

import Foundation

enum NetworkError:String,Error{
    case invalidURL="Invaild URL."
    case unableToFetch="Unable to get Videos."
    case badLocalUrl="Bad Local URL."
}
