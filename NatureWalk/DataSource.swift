//
//  DataSource.swift
//  NatureWalk
//
//  Created by Simon Chan on 2024-06-12.
//

import Foundation

class DataSource : ObservableObject{
    
    @Published var sessionList : [Session] = [
        Session(name: "High Park To Old Mill – 100th Anniversary Walk – Public WalkDate", description: "This is our final 100th anniversary walk. It is an attempt to recreate the first TFN walk, or “field trip” as it was called, which took place on April 26th, 1924 and was led by Stuart Thompson (nephew of E.T. Seton). From our starting point we walk south along the east side of High Park towards the lower ponds. We’ll then head west along the southern end of the park towards Ellis Avenue, where we will head south along the waterfront trail following the trail across the Humber bridge. Then we’ll walk  up the Humber River, following the Humber River trail towards Bloor Street, to the Old Mill. There will be points along the way for attendees to turn back or catch transit. We will enjoy what nature has to offer and discuss the connection to the TFN outings program in this area.", starRating: 3, organizationName: "Toronto Field Naturalists", photo: ["https://media.cntraveler.com/photos/5b2c06854c18411aa3e9f5d3/16:9/w_2560,c_limit/High-Park_GettyImages-171589236.jpg", "https://img1.10bestmedia.com/Images/Photos/373770/17103378200-4be268189d-h_55_660x440.jpg"], pricing: 50.0, phone: "4165932656"),
        Session(name: "LETCHWORTH STATE PARK, FLT LETCHWORTH BRANCH TRAIL", description: "Letchworth State Park, renowned as the Grand Canyon of the East, is one of the most scenically magnificent areas in the eastern U.S. The Genesee River roars through the gorge over three major waterfalls between cliffs--as high as 600 feet in some places--surrounded by lush forests.", starRating: 5, organizationName: "Toronto Bruce Trail Club", photo: ["https://parks.ny.gov/photos/parks/07948c28-65df-40e1-ae17-2fd4a1307d42.jpg", "https://manhattantoroam.com/wp-content/uploads/2020/08/IMG_8516-scaled.jpg"], pricing: 70.0, phone: "9055296821"),
        Session(name: "Blue Mountain End to End in 3 Hikes ~ Stained Glass Fundraiser Badge", description: "This series of hikes is a Fundraiser series for the Blue Mountains Bruce Trail Club. All proceeds fund the activities of the Club directly. You are signing up for all 3 hikes, and must be present for all the hikes to receive the special fundraising badge.Hikers will receive a schedule of the Itinerary for all 3 hikes upon registration. Each Hike is 22-23 Km. The GPS coordinates for Hike on Day #1 are provided here. We will be starting the hike from Maple Lane, at the Blue Mountains Beaver Valley Boundary", starRating: 2, organizationName: "Toronto Bruce Trail Club", photo: ["https://www.bluemountain.ca/-/media/blue-mountain/image-slider-2400x1350/conferences/bm_meetingsreimagined_spring.jpg?h=57%25&w=100%25&hash=9CD0E2192A3C78CA4C8B53AE03BA5DFB", "https://www.bluemountain.ca/-/media/widen/blue-mountain-resort/bm-attractions--activities/hiking/2020-07-23-bm-hiking-0007-jpg.jpg?w=480&rev=d69ea334d6e34bcf8909668fcef393d5&hash=9B5650261252F24009C1C47AD020F87C"], pricing: 35.0, phone: "9055296821")
    ]
    
    
    
}
