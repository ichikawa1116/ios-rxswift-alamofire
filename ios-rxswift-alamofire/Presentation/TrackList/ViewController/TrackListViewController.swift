//
//  ViewController.swift
//  ios-rxswift-alamofire
//
//  Created by on 2018/03/25.
//  Copyright © 2018  All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class TrackListViewController: UIViewController {
    
    @IBOutlet weak var trackListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var coverView: UIView!
    private var TrackModelArray: Array<TrackModel> = []
    private var presenter: TrackListPresenter?
    private var indicatorView = UIView()
    fileprivate let provider = TrackListDataProvider()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        self.searchBar.delegate = self
        coverView.isHidden = false
        searchBar.showsCancelButton = true
        
        edgesForExtendedLayout = .bottom
    }
    
    func setupTable(){
        self.trackListTableView.dataSource = provider
        self.trackListTableView.delegate = self
        self.trackListTableView.tableFooterView = UIView(frame: .zero)
        self.trackListTableView.register(UINib(nibName: TrackCell.cellName, bundle: nil), forCellReuseIdentifier: TrackCell.cellName)
    }
    
    func inject(presenter: TrackListPresenter){
        self.presenter = presenter
        
        self.presenter?.trackModelArray = { list in
            if let list = list {
                if list.count == 0 {
                    self.coverView.isHidden = false
                }else {
                    self.coverView.isHidden = true
                }
                self.provider.trackList = list
            }else {
                self.coverView.isHidden = false
            }
            self.trackListTableView.reloadData()
            //self.TrackModelArray = list!
        }
    }
}

//MARK : -UITableViewDelegate
extension TrackListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return TrackCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // 選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
//        let nextViewController: TrackDetailViewController = TrackDetailViewController()

        //UINavigationControllerを使って，次の画面のControllerに遷移
//        if let navigationController = navigationController {
//        navigationController.pushViewController(nextViewController, animated: true)
//        }
//
    }
}

//MARK : -UISearchBarDelegate
extension TrackListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let artist = searchBar.text {
//            indicatorView = UIViewController.displaySpinner(onView: self.view)
            presenter?.tapSearchButton(artistString: artist)
        }
    }
}

//MARK: -
extension TrackListViewController: TrackListPresenterDelegate {
    func setTracks(result: TrackListModel) {
        UIViewController.removeSpinner(spinner: indicatorView)
        if let result = result.list {
            if result.count == 0 {
                coverView.isHidden = false
            }else {
                coverView.isHidden = true
            }
            self.provider.trackList = result
        }else {
            coverView.isHidden = false
        }
        self.trackListTableView.reloadData()
    }
    
    func showErrorMessage() {
        UIViewController.removeSpinner(spinner: indicatorView)
        let alert: UIAlertController = UIAlertController(
            title: "警告",
            message: "通信環境の良い場所で再度お試しください。",
            preferredStyle:  UIAlertControllerStyle.alert
        )
        
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler:{
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
