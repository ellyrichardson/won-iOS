//
//  GenericDataSource.swift
//  won-iOS
//
//  Created by Elly Richardson on 11/23/20.
//  Copyright © 2020 EllyRichardson. All rights reserved.
//

import UIKit
import RealmSwift

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
