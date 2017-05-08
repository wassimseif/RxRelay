# RxRelay

This is my attempt to create an [RxRelay](https://github.com/JakeWharton/RxRelay) implementation in [RxSwift](https://github.com/ReactiveX/RxSwift).
### Why 
Because the [Observer](https://en.wikipedia.org/wiki/Observer_pattern) Design pattern is something every developer should know. It facilitates the communication between objects and simplify the logic of your app. Implementing it in a Reactive way will take it to a whole new level.

### Usage 


 *  **`BehaviorRelay`**

    Relay that emits the most recent item it has observed and all subsequent observed items to each
    subscribed `Observer`.

 *  **`PublishRelay`**

    Relay that, once an `Observer` has subscribed, emits all subsequently observed items to the
    subscriber.
```
 var relay = PublishRelay<String>()
        
        let subscription = relay.subsribe { (string ) in
            print("I have Received :\(string)")
        }
        
        relay.accept("Hello")
        relay.accept("World")
        subscription.dispose()
        relay.accept("Will not be emitted ")
```

 *  **`ReplayRelay`**

    Relay that buffers all items it observes and replays them to any `Observer` that subscribes.
    ```
	let relay = ReplayRelay<String>(withBufferSize: 2)
	relay.accept("1")
	relay.accept("2")
	relay.accept("3")
	let subscription = relay.subsribe { (string) in
		print("I have received : \(string)")
    }
	// subscription will get 2 , 3 , 4
	relay.accept("4")
	```
