import * as React from 'react';
import {SearchCriteria, SortingOption} from '../api';
import {Dropdown} from 'react-bootstrap';
import {v4 as uid} from 'uuid';

interface Props {
    searchCriteria: SearchCriteria;

    onPageSizeChange(pageSize: number): void;

    onSortingOptionChange(sortingOption: SortingOption): void;
}

export const sortingOptions: SortingOption[] = [
    {
        label: 'Sort by name (Z to A)',
        sort: {
            fieldName: 'name',
            direction: 'DESC'
        }
    },
    {
        label: 'Sort by name (A to Z)',
        sort: {
            fieldName: 'name',
            direction: 'ASC'
        }
    },
    {
        label: 'Sort by category name (Z to A)',
        sort: {
            fieldName: 'category.categoryName',
            direction: 'DESC'
        }
    },
    {
        label: 'Sort by category name (A to Z)',
        sort: {
            fieldName: 'category.categoryName',
            direction: 'ASC'
        }
    },
]

const ProductCatalogSearchTools: React.FC<Props> = (props) => {
    const {
        searchCriteria,
        onPageSizeChange,
        onSortingOptionChange
    } = props;
    const pageSizes = [5, 10, 20];

    return (<>
        <div className="row">
            <div className="flex-column">
                <Dropdown>
                    <Dropdown.Toggle variant="outline-primary" id="dropdown-basic">
                        {searchCriteria.pageSize}
                    </Dropdown.Toggle>
                    <Dropdown.Menu>
                        {pageSizes.map(pageSize => <Dropdown.Item key={uid()}
                            onClick={() => onPageSizeChange(pageSize)}>{pageSize}</Dropdown.Item>
                        )}
                    </Dropdown.Menu>
                </Dropdown>

            </div>
            <div className="col">
                <Dropdown>
                    <Dropdown.Toggle variant="outline-primary" id="dropdown-advanced">
                        {searchCriteria.sortingOption.label}
                    </Dropdown.Toggle>
                    <Dropdown.Menu>
                        {sortingOptions.map(sortingOption => (<Dropdown.Item key={uid()}
                            onClick={() => onSortingOptionChange(sortingOption)}>{sortingOption.label}</Dropdown.Item>))}
                    </Dropdown.Menu>
                </Dropdown>


            </div>
        </div>
    </>);
}

export default ProductCatalogSearchTools;
