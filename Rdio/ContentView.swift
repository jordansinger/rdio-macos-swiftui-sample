//
//  ContentView.swift
//  Rdio
//
//  Created by Jordan Singer on 7/7/20.
//

import SwiftUI

struct Album: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var artist: String
    var image: String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            Trending()
        }
        .navigationTitle("Trending")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: { }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(true)
            }
                    
            ToolbarItem(placement: .navigation) {
                Button(action: { }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(true)
            }
            
            ToolbarItem(placement: .status) {
                HStack {
                    Text("Jordan Singer")
                    
                    Divider()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.secondary)
                }
                .foregroundColor(.secondary)
            }

            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "bell")
                }
            }
        }
    }
}

struct Sidebar: View {
    @State var selection: Set<Int> = [0]
    
    var body: some View {
        List(selection: self.$selection) {
            Group {
                Text("Home")
                Text("Trending")
                    .tag(0)
                Text("New Releases")
                Text("Recommendations")
                Text("People")
                Text("Stations")
            }
            
            Divider()
            
            Group {
                Text("Collection")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text("Favorites")
                Text("Downloads")
            }
            
            Divider()
            
            Group {
                Text("Playlists")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Label("Daily", systemImage: "music.note.list")
                Label("Workout", systemImage: "music.note.list")
                Label("2020", systemImage: "music.note.list")
                Label("Throwback", systemImage: "music.note.list")
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 192, idealWidth: 192, maxWidth: 256, maxHeight: .infinity)
    }
}

struct Trending: View {
    @State var albums = [
        Album(title: "My Beautiful Dark Twisted Fantasy", artist: "Kanye West", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/kanye-west-my-beautiful-dark-twisted-fantasy.jpg?resize=1240,1240&w=385"),
        Album(title: "Lemonade", artist: "Beyoncé", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/beyonce-lemonade.jpeg?resize=1240,1240&w=385"),
        Album(title: "To Pimp a Butterfly", artist: "Kendrick Lamar", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/kendrick-lamar-to-pimp-a-butterfly.jpg?resize=1240,1240&w=385"),
        Album(title: "Take Care", artist: "Drake", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/drake-take-care.jpg?resize=1240,1240&w=385"),
        Album(title: "21", artist: "Adele", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/adele-21.jpg?resize=1240,1240&w=385"),
        Album(title: "This Is Happening", artist: "LCD Soundsystem", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/lcd-soundsystem-this-is-happening.jpg?resize=1240,1240&w=385"),
        Album(title: "Blonde", artist: "Frank Ocean", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/frank-ocean-blond.jpg?resize=1240,1240&w=385"),
        Album(title: "Yeezus", artist: "Kanye West", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/kanye-west-yeezus.jpg?resize=1240,1240&w=385"),
        Album(title: "Acid Rap", artist: "Chance the Rapper", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/chance-the-rapper-acid-rap.jpg?resize=1240,1240&w=385"),
        Album(title: "A Seat at the Table", artist: "Solange", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/solange-a-seat-at-the-table.jpg?resize=1240,1240&w=385"),
        Album(title: "Anti", artist: "Rihanna", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/rihanna-anti.jpg?resize=1240,1240&w=385"),
        Album(title: "DAMN.", artist: "Kendrick Lamar", image: "https://www.rollingstone.com/wp-content/uploads/2019/11/kendrick-lamar-damn.jpg?resize=1240,1240&w=385")
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Text("Albums")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            
                            Image(systemName: "chevron.down")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(albums, id: \.id) { album in
                                AlbumView(album: album)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .padding(.bottom, 64)
            .background(Color(NSColor.controlBackgroundColor))
            
            NowPlaying()
        }
        .frame(minWidth: 880, maxHeight: .infinity)
    }
}

struct NowPlaying: View {
    var body: some View {
        HStack(spacing: 32) {
            Spacer()
            
            HStack(spacing: 24) {
                Image(systemName: "backward.fill")
                    .font(.title3)
                Image(systemName: "play.fill")
                    .font(.title)
                Image(systemName: "forward.fill")
                    .font(.title3)
            }
            
            Spacer()
            
            VStack(spacing: 2) {
                Text("Dark Fantasy — Kanye West")
                
                HStack(spacing: 16) {
                    Image(systemName: "shuffle")
                    Text("0:00")
                        
                    Rectangle()
                        .foregroundColor(Color(NSColor.separatorColor))
                        .frame(height: 3)
                        .cornerRadius(3)
                    
                    Text("4:41")
                    Image(systemName: "repeat")
                }
                .font(.callout)
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "speaker.wave.2.fill")
                .font(.title3)
            
            Spacer()
        }
        .padding()
        .frame(height: 64)
        .background(EffectsView(material: NSVisualEffectView.Material.sidebar, blendingMode: NSVisualEffectView.BlendingMode.behindWindow))
    }
}

struct AlbumView: View {
    @State var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageView(imageUrl: album.image)
                .clipped()
                .cornerRadius(8)
                .frame(width: 192, height: 192)
                .background(Color(NSColor.separatorColor))
            
            Text(album.title)
                .lineLimit(1)
            Text(album.artist)
                .foregroundColor(.secondary)
        }
    }
}

// image view
struct ImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }
    
    var body: some View {
        Image(nsImage: NSImage(data: self.remoteImageURL.data) ?? NSImage())
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
    }
}

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    // load our image URL
    init(imageURL: String) {
        guard let url = URL(string: imageURL.replacingOccurrences(of: "http://", with: "https://")) else {
            print("Invalid URL")
            return
        }
      
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }.resume()
    }
}

// blur effect
struct EffectsView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
