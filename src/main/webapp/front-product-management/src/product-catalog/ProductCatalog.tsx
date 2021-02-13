import * as React from 'react';
import {useEffect, useState} from 'react';
import {fetchProducts} from '../api/product-api';
import {Products, SearchCriteria, SortingOption} from '../api';
import ProductCatalogSearchTools, {sortingOptions} from './ProductCatalogSearchTools';
import ProductCatalogPagination from './ProductCatalogPagination';
import {v4 as uid} from 'uuid';
import './product-catalog.css'

interface State {
    products: Products;
    searchCriteria: SearchCriteria
}

interface Props {
}


const initialState: State = {
    products: {
        items: [],
        totalPages: 0,
        totalElements: 0
    },
    searchCriteria: {
        pageNo: 0,
        pageSize: 20,
        sortingOption: sortingOptions[0]
    }
};

const ProductCatalog: React.FC<Props> = (props) => {
    const [products, setProducts] = useState(initialState.products);
    const [searchCriteria, setSearchCriteria] = useState(initialState.searchCriteria);

    useEffect(() => {
        fetchProducts(searchCriteria).then(setProducts)
    }, [searchCriteria])

    const onSortingOptionChange = (sortingOption: SortingOption) => {
        setSearchCriteria({...searchCriteria, sortingOption, pageNo: 0});
    }

    const onPageSizeChange = (pageSize: number) => {
        setSearchCriteria({...searchCriteria, pageSize, pageNo: 0});
    }

    const onPageNoChange = (pageNo: number) => {
        setSearchCriteria({...searchCriteria, pageNo});
    }

    return (<>
            <div className="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
                <h1 className="display-4">Product Management</h1>
                <p className="lead">Simple application</p>
            </div>
            <div className="container">
                <ProductCatalogSearchTools searchCriteria={searchCriteria}
                                           onPageSizeChange={onPageSizeChange}
                                           onSortingOptionChange={onSortingOptionChange}/>
                <hr/>
                <div className="row">
                    {products.items.map((product) => (
                        <div className="col-sm-6 col-md-4" key={uid()}>
                            <div className="card mb-4 product-card">
                                <div className="card-body">
                                    <h5 className="card-title">{product.name}</h5>
                                    <h6 className="card-subtitle mb-2 text-muted">{product.categoryName}</h6>
                                    <p className="card-text">{product.description}</p>
                                    <div className="add-to-basket">
                                        <a href="#" className="card-link">Add to basket</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    ))}
                </div>
                <ProductCatalogPagination onPageNoChange={onPageNoChange}
                                          totalPages={products.totalPages}
                                          pageNo={searchCriteria.pageNo}/>
            </div>
        </>
    );
}

export default ProductCatalog;
