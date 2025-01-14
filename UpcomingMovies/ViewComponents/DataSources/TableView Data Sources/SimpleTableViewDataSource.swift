//
//  SimpleTableViewDataSource.swift
//  UpcomingMovies
//
//  Created by Alonso on 2/9/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

final class SimpleTableViewDataSource<ViewModel>: NSObject, UITableViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UITableViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    private let cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }
    
}

extension SimpleTableViewDataSource where ViewModel == MovieCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieTableViewCell.dequeueIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels,
                                         reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! MovieTableViewCell
                                            cell.viewModel = viewModel
                                         })
    }
    
}

extension SimpleTableViewDataSource where ViewModel == MovieVideoCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieVideoTableViewCell.dequeueIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels,
                                         reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! MovieVideoTableViewCell
                                            cell.viewModel = viewModel
                                         })
    }
    
}

extension SimpleTableViewDataSource where ViewModel == MovieReviewCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieReviewTableViewCell.dequeueIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels,
                                         reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! MovieReviewTableViewCell
                                            cell.viewModel = viewModel
                                         })
    }
    
}

extension SimpleTableViewDataSource where ViewModel == CustomListCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = CustomListTableViewCell.dequeueIdentifier) -> SimpleTableViewDataSource {
        return SimpleTableViewDataSource(cellViewModels: cellViewModels,
                                         reuseIdentifier: reuseIdentifier,
                                         cellConfigurator: { (viewModel, cell) in
                                            let cell = cell as! CustomListTableViewCell
                                            cell.viewModel = viewModel
                                         })
    }
    
}
