//
//  ContentView.swift
//  Mulmed_Mid_Exam
//
//  Created by Vinchen Amigo on 28/04/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        // menampilkan ARViewContainer secara full screen
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

//Struct ini bertanggung jawab untuk menginisialisasi dan menampilkan sebuah ARView pada user interface.
struct ARViewContainer: UIViewRepresentable {
   
    // membuat UIView yang menampilkan ARView
    //UIView adalah kelas dasar dari semua elemen antarmuka pengguna di iOS. Ia merupakan wadah yang dapat
    //menampilkan dan mengelola tampilan seperti tombol, teks, gambar, dan elemen lainnya.
    func makeUIView(context: Context) -> ARView {
        //Membuat ARView
        //ARView adalah kelas yang disediakan oleh RealityKit untuk menampilkan objek dan scene dalam Augmented
        //Reality. Ia mengatur semua aspek rendering 3D yang terkait dengan pengalaman AR, seperti menambahkan
        //cahaya, bayangan, dan menangani interaksi pengguna. Di dalam ARView, kita menambahkan Anchor sebagai
        //objek yang akan ditampilkan.
        let arView = ARView(frame: .zero)
       
        // memuat scene "Book" dari Reality File "Experience"
        //Scene dalam konteks RealityKit merujuk pada dunia 3D yang sedang ditampilkan di ARView. Scene berisi
        //satu atau lebih Anchor yang merepresentasikan objek atau scene dalam ruang 3D, dan masing-masing Anchor
        //dapat berisi satu atau lebih Entity yang merepresentasikan model 3D.
        let sceneAnchor = try! Experience.loadBook()
      
        
        // menambahkan scene anchor ke dalam scene di ARView
        //Anchor adalah objek RealityKit yang merepresentasikan posisi, rotasi, dan skala suatu objek atau scene
        //dalam ruang 3D.
        arView.scene.anchors.append(sceneAnchor)
        
        return arView
        
    }
    // memperbarui tampilan UIView jika terdapat perubahan pada View SwiftUI-nya
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
