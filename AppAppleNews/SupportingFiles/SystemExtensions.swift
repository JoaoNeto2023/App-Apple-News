//
//  SystemExtensions.swift
//  AppAppleNews
//
//  Created by João Neto  on 03/10/23.
//

import UIKit

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}

extension UIImageView {
    
    func downloaded(form url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mineType = response?.mimeType, mineType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(named: "erro.jpeg")
                }
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
                
            }
            
        }.resume()
    }
    
    func loadImage(from link: String?, contentMode mode: ContentMode = .scaleToFill) {
        guard let link = link, let url = URL(string: link) else {
            self.image = UIImage(named: "erro.jpeg")
            return
        }
    downloaded(form: url, contentMode: contentMode)
  }
    
}
extension Date {
    
    func toString(with formatter: String = "dd/MM/yyyy")  -> String? {
        let dateFormat = DateFormatter()
        
        if Calendar.current.isDateInToday(self){
            dateFormat.dateFormat = "HH:mm"
            dateFormat.locale = Locale.init(identifier: "pt-br")
            dateFormat.timeZone  = TimeZone(abbreviation: "UTC")
            return "Hoje as \(dateFormat.string(from: self))"
        }
        
        dateFormat.dateFormat = formatter
        return dateFormat.string(from: self)
        
    }
}
