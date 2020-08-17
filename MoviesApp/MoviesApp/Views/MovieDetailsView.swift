//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Diego Jurfest Ceccon on 16/08/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            
            
            //Image(movie.poster)
            Text(movie.title)
            
        }
    }
    
}

struct MovieDetailsView_Previews: PreviewProvider {

    static var previews: some View {
        let movie = Movie(title: "Once Upon a Time in the West", imdbId: "test", poster: "test")
        
        return MovieDetailsView(movie: movie)
    }
}
