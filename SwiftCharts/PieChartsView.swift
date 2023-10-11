import Charts
import SwiftUI





struct PieChartsView: View {
    
//    let defaultPlotFrame: Anchor<CGRect> = .constant(CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var body: some View {
        ScrollView {
            VStack {
                
                VStack(alignment: .leading) {
                    
                Text("Pie Charts")
                    .fontWeight(.bold)
                    .font(.title)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Most Sold Style")
                            .fontWeight(.light)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Text(Pancake.flavorOfPancakeWithHighestSales() ?? "Sweet")
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                    .padding()
                    
                    Spacer()
                }
               
                
                    
                Chart(Pancake.defaultPancakes, id: \.flavor) { pancake in
                    SectorMark(
                        angle: .value("Sales", pancake.sales),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Flavor", pancake.flavor))
                }
                .chartXAxis(.hidden)
                .aspectRatio(contentMode: .fit)
                .padding()
                    
                }
                .padding()
                    
                VStack(alignment: .leading) {
                    
                Text("Donut Charts")
                    .fontWeight(.bold)
                    .font(.title)
                
                Chart(Pancake.defaultPancakes, id: \.flavor) { pancake in
                    SectorMark(
                        angle: .value("Sales", pancake.sales),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Flavoer", pancake.flavor))
                }
                .chartXAxis(.hidden)
                .aspectRatio(contentMode: .fit)
                .padding()
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame]
                        VStack {
                            Text("Most Sold Style")
                                .fontWeight(.light)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Text(Pancake.flavorOfPancakeWithHighestSales() ?? "Sweet")
                                .fontWeight(.bold)
                                .font(.title2)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                        
                    }
                    
                
                    
                    
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    PieChartsView()
}
