import {Products, ProductsResponse, SearchCriteria} from './index';

export type QueryParams = Array<{ parameter: string; value: string }>;

export function fetchProducts(searchCriteria: SearchCriteria): Promise<Products> {
    return authenticatedRequest(`/api/v1/products?${toQueryString(toPagingSortingQueryParams(searchCriteria))}`)
        .then(response => response.json())
        .then(json => asProducts(json));
}

function asProducts(passApi: ProductsResponse): Products {
    return {...passApi}
}

function authenticatedRequest(url: string, init: RequestInit = {}): Promise<Response> {
    const headers = {
        ...init.headers,
    };
    return fetch(url, {...init, headers});
}

function toPagingSortingQueryParams(searchCriteria: SearchCriteria): QueryParams {
    const {pageNo, sortingOption, pageSize} = searchCriteria;
    return [
        {parameter: 'pageNo', value: pageNo.toString()},
        {parameter: 'pageSize', value: pageSize.toString()},
        ...(!!sortingOption.sort && !!sortingOption.sort.direction && !!sortingOption.sort.fieldName
            ? [
                {parameter: 'sort', value: sortingOption.sort.fieldName},
                {parameter: 'direction', value: sortingOption.sort.direction}]
            : [])
    ];
}

function toQueryString(queryParams: QueryParams) {
    return queryParams.map(param => [param.parameter, encodeURIComponent(param.value)].join('=')).join('&');
}
