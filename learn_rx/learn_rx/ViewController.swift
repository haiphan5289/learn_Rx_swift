//
//  ViewController.swift
//  learn_rx
//
//  Created by HaiPhan on 7/13/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    var search: UISearchBar!
    var tb_search: UITableView!
    var shownCities = [String]() // Data source for UITableView
    let allCities = ["Oklahoma", "Chicago", "Moscow", "Danang", "Vancouver", "Praga"]
    var isSearching: Bool = false
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
//        setup_view()
//        search
//            .rx.text
//            .orEmpty
//            .debounce(.microseconds(1), scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .filter({ !$0.isEmpty })
//            .subscribe(onNext: { [unowned self] query  in
//                self.shownCities = self.allCities.filter({ $0.hasPrefix(query) })
//                self.isSearching = true
//                self.tb_search.reloadData()
//            })
//            .addDisposableTo(disposeBag)
//        let bag = disposeBag
//        let hello = Observable.just("hello")
//        let arracy = Observable.from([1,2,3,4,5])
//        let dic = Observable.from([1: "Hello", 2: "Word"])
//        let sub = hello.subscribe(onNext: { (event) in
//            print(event)
//        })
//        let sub = hello.subscribe { (event) in
//            print(event)
//        }
//        sub.addDisposableTo(bag)
//        let bag = disposeBag
//
////        let publicsuject = PublishSubject<String>()
////        PublishSubject.onNext("Hello")
////        PublishSubject.onNext("Hi")
//        var publishSubject = PublishSubject<String>()
//
//        // This will not affect the Subscription
//        publishSubject.onNext("Hello")
//        publishSubject.onNext("World")
//        let sub = publishSubject.subscribe(onNext:{
//            print(#line,$0)
//        })
////        sub.addDisposableTo(bag)
//
//        // This will emit to subscription1
//        publishSubject.onNext("Hello")
//        publishSubject.onNext("Again")
//
//        let sub2 = publishSubject.subscribe(onNext: {
//            print(#line, $0)
//        })
//        publishSubject.onNext("Ba")
//        sub.dispose()
//        publishSubject.onNext("bon")
        
//        let subscription2 = publishSubject.subscribe(onNext:{
//            print(#line,$0)
//        })
        
//        publishSubject.onNext("Both will receive")
        
        //Dispose subscription 1 so just subscription 2 will receive the elements
//        sub.dispose()
        
        //behaviour Subject
//        BehaviourSubjet: Một behavior subjet sẽ gởi element mới nhất đến bất kỳ subcribe nào sau khi tiến hành subcribe nó.
        //khỏi tạo behaviout với 1 element
//        let bag = disposeBag
//        var behaviorSubject = BehaviorSubject<String>(value: "Một")
//        //sub1
//        let sub1 = behaviorSubject.subscribe(onNext: {
//            print(#line,$0)
//        }).addDisposableTo(bag)
//        behaviorSubject.onNext("Hai")
//        behaviorSubject.onNext("Ba")
//        //tạo sub2, để check giái trị mới nhất behaviour
//        //Lúc này behavior của sub2 sẽ có element là = Ba
//        let sub2 = behaviorSubject.subscribe(onNext: {
//            print(#line,$0)
//        }).addDisposableTo(bag)
//        //Lúc này sub1 & sub2 có giái trị mới nhất "Bốn"
//        behaviorSubject.onNext("Bốn")
        //khởi tạo 1 biến Reply
        //Khởi tạo số lần gọi hàm khi thay đổi giái trị
//        let replay = ReplaySubject<String>.create(bufferSize: 2)
//        //subscribe lần 1 khi chưa thêm/thay đổi giái trị sẽ lấy total
//        let sub1 = replay.subscribe(onNext: {
//            print(#line,$0)
//        })
//        replay.onNext("Một")
//        replay.onNext("Hai")
//        replay.onNext("Ba")
//        //sub2 sẽ hiển thị số lần khi đã set
//        let sub2 = replay.subscribe(onNext: {
//                        print(#line,$0)
//        })
        
//        //khởi tạo biến variable và giái trị
//        let varable = Variable("Một")
//        //truyền thêm 1 giái trị vào variable
//        varable.value = "Hai"
//        //subsribe variable
//        varable.asObservable().subscribe(onNext: {
//            print(#line, $0)
//        })
//        varable.value = "Ba"
        
        
//        //khởi tạo 1 observable
//        let a = Observable.of(1,2,3,4)
//        //trước khi giái trị đưa vau subscribe thì transformation nó = map
//        let map = a.map { (b) in
//            return b * 5
//        }
//        //giái trị đầu của obsservable đã thay đổi
//        let sub = map.subscribe(onNext: {
//            print(#line, $0)
//        })
        let a = Observable.of(1,2,10,20)
        let sub = a.filter { return $0 > 5 }.subscribe(onNext: {
            print(#line,$0)
        })
        
    }
    
    func setup_view(){
        search_autolayout()
        tb_search_autolayout()
    }
    
    func tb_search_autolayout(){
        tb_search = UITableView()
        self.view.addSubview(tb_search)
        
        tb_search.translatesAutoresizingMaskIntoConstraints = false
        tb_search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tb_search.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0).isActive = true
        tb_search.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        tb_search.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        tb_search.delegate = self
        tb_search.dataSource = self
        tb_search.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func search_autolayout(){
        search = UISearchBar()
        search.placeholder = " Search...."
        self.view.addSubview(search)
        
        search.translatesAutoresizingMaskIntoConstraints = false
        search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        search.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        search.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        search.delegate = self
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return shownCities.count
        }
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb_search.dequeueReusableCell(withIdentifier: "cell")
        if isSearching {
            cell?.textLabel?.text = shownCities[indexPath.row]
        }else {
           cell?.textLabel?.text = allCities[indexPath.row]
        }
//        cell?.textLabel?.text = allCities[indexPath.row]
        return cell!
    }
    
    
}
//extension ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        shownCities = self.allCities.filter({ $0.prefix(searchText.count) == searchText })
//        isSearching = true
//        self.tb_search.reloadData()
//    }
//}

