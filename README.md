# CFCAppDemo (Or Carbon Footprint Calculator app demo)

This is a demo mobile application written in SwiftUI in which the user can select an origin and a destination airport, and calculate the carbon footprint of taking a flight between the selected airport.

##  🔧 Environment
![<iOS>-<iOS 16.2 and later>](https://img.shields.io/badge/iOS-iOS%2016.2%20and%20later-brightgreen)  
![<Xcode>-<Xcode 14.2>](https://img.shields.io/badge/Xcode-Xcode%2014.2-blue)  
![<Swift>-<Swift 5>](https://img.shields.io/badge/Swift-Swift%205-informational)  

##  📲 Prerequisites
In this demo, we took the approach to secure the secrets in the easiest, yet quite effective Apple’s way, using `.plist` file.

You are going to need your [toohla](https://www.toohla.com/) api-key, which is used to get the flight offset data from their web services.

Once you get the API Key from `toohla`, please follow the below steps to secure the api key.

### Step 1
Add a `plist` file at the root level of this project, and name it as you want.

In this demo, it is supposed to be `API_KEY`.

![image](https://user-images.githubusercontent.com/52396717/220293279-758ff46d-87a9-4489-89ce-dc4669be761a.png)
![image](https://user-images.githubusercontent.com/52396717/220293377-89d91f6b-5b97-40d1-9467-4a152ed0d333.png)

### Step 2
Add your api key to the added `API_KEY.plist` file.

![image](https://user-images.githubusercontent.com/52396717/220294050-e83d2480-eef8-4ba1-a6b4-64eabfba529d.png)


🎉🎉🎉 You are now all set.



##  ✈️ 🏨 Key Components and Design Decisions

It consists of 3 pages total, i.e. Main page, the flight search screen for `From-Location` and the `To-Destination`, and the flight offset show-off page.

* Basic UI/UX Design Using SwiftUI Components
* Demonstration of the simple navigation using `NavigationView` and `NavigationStack`
* Demonstration of the custom search text field and the list
* Demonstration of How to throttle search (based on typing speed)
* Demonstration of using color sets for the light/dark appearance
* Demonstration of using ViewModel - (expandable to MVVM design pattern)
* Demonstration of custom API client using `URLRequest`
* Demonstration of securing API Key by using `.plist` file
* ...




##  🍔 🥩 Sample GIF and Images

|Light|Dark|
|:--:|:--:|
|![light](https://user-images.githubusercontent.com/52396717/220305000-caf7607d-cfa9-4a9d-93c3-196b8597b61a.gif)|![dark](https://user-images.githubusercontent.com/52396717/220305027-35527ad8-c846-421e-994e-ec3863be4349.gif)|


### Flight Search
|Light|Dark|
|:--:|:--:|
|![Simulator Screen Shot - iPhone 14 Pro - 2023-02-21 at 04 23 19](https://user-images.githubusercontent.com/52396717/220304279-51524776-df90-4583-bd0c-3677b54fac80.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-02-21 at 04 24 06](https://user-images.githubusercontent.com/52396717/220304361-d71476d9-abfd-46c5-a277-0143ec244710.png)|

### Flight Offset
|Light|Dark|
|:--:|:--:|
|![Simulator Screen Shot - iPhone 14 Pro - 2023-02-21 at 04 23 25](https://user-images.githubusercontent.com/52396717/220304611-ae0c4957-db50-4b20-89e0-4860cd61345d.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-02-21 at 04 22 50](https://user-images.githubusercontent.com/52396717/220304678-c1aa9161-898f-4876-8805-900b67919f6a.png)|




##  🏗️ Building

Building and running the project is as simple as cloning the repository, opening [CFCAppDemo.xcodeproj](https://github.com/creative-dev-lab/CFCAppDemo/tree/master/CFCAppDemo.xcodeproj) and building the CFCAppDemo target.
