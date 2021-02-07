import * as React from 'react';

interface Props {
    pageNo: number;

    onPrevious(): void;

    onNext(): void;
}

const ProductCatalogPagination: React.FC<Props> = (props) => {
    const {
        onPrevious,
        onNext,
        pageNo
    } = props;

    return (<>
        <nav aria-label="Page navigation example">
            <ul className="pagination">
                <li className="page-item">
                    <a type='button' className="page-link" onClick={onPrevious}>Previous</a>
                </li>
                <li className="page-item">
                    <a className="page-link">{pageNo + 1}</a>
                </li>
                <li className="page-item">
                    <a type='button' className="page-link" onClick={onNext}>Next</a>
                </li>
            </ul>
        </nav>
    </>);
}

export default ProductCatalogPagination;
