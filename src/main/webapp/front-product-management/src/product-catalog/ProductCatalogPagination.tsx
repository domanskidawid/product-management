import * as React from 'react';

interface Props {
    pageNo: number;
    totalPages: number;

    onPageNoChange(pageNo: number): void;
}

const ProductCatalogPagination: React.FC<Props> = (props) => {
    const {
        totalPages,
        onPageNoChange,
        pageNo
    } = props;

    const onPrevious = () => {
        onPageNoChange(pageNo - 1)
    }
    const onNext = () => {
        onPageNoChange(pageNo + 1)
    }

    const previousButtonCss = ['page-item', pageNo > 0 ? [] : ['disabled']].join(' ');
    const nextButtonCss = ['page-item', pageNo + 1 < totalPages ? [] : ['disabled']].join(' ');

    return (<>
        <nav aria-label="Page navigation example">
            <ul className="pagination">
                <li className={previousButtonCss}>
                    <a type='button' className="page-link" onClick={onPrevious}>Previous</a>
                </li>
                <li className="page-item">
                    <a className="page-link">{pageNo + 1}</a>
                </li>
                <li className={nextButtonCss}>
                    <a type='button' className="page-link" onClick={onNext}>Next</a>
                </li>
            </ul>
        </nav>
    </>);
}

export default ProductCatalogPagination;
