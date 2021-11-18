//
//  RoomProgressLHS.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressLHS: View {
    var body: some View {
        GeometryReader { gr in
            Path { path in
                path.addArc(center: CGPoint(x: 0, y: gr.size.height/2), radius: 12, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
            Path { path in
                path.move(to: CGPoint(x: 0, y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width , y: gr.size.height/2))
            }
            .stroke(style: StrokeStyle(lineWidth: 1))
            .foregroundColor(Color.black)
            Path { path in
                path.addArc(center: CGPoint(x: gr.size.width, y: gr.size.height/2), radius: 12, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
        }
    }
}

struct RoomProgressMiddle: View {
    var body: some View {
        GeometryReader { gr in
            Path { path in
                path.move(to: CGPoint(x: 0, y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width , y: gr.size.height/2))
            }
            .stroke(style: StrokeStyle(lineWidth: 1))
            .foregroundColor(Color.black)
            Path { path in
                path.addArc(center: CGPoint(x: gr.size.width, y: gr.size.height/2), radius: 12, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
        }
    }
}

struct RoomProgressDownwards: View {
    var body: some View {
        GeometryReader { gr in
            Path { path in
                path.move(to: CGPoint(x: 0, y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width , y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width, y: gr.size.height))
            }
            .stroke(style: StrokeStyle(lineWidth: 1))
            .foregroundColor(Color.black)
            Path { path in
                path.addArc(center: CGPoint(x: gr.size.width, y: gr.size.height/2), radius: 12, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
        }
    }
}

struct RoomProgressUpwards: View {
    var body: some View {
        GeometryReader { gr in
            Path { path in
                path.move(to: CGPoint(x: 0, y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width , y: gr.size.height/2))
                path.addLine(to: CGPoint(x: gr.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1))
            .foregroundColor(Color.black)
            Path { path in
                path.addArc(center: CGPoint(x: gr.size.width, y: gr.size.height/2), radius: 12, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
        
        }
    }
}
struct RoomProgressLHS_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressLHS()
    }
}
