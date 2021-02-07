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

function toQuery(passApi: ProductsResponse): Products {
    return {...passApi}
}


export function authenticatedRequest(url: string, init: RequestInit = {}): Promise<Response> {
    const headers = {
        ...init.headers,
    };
    return fetch(url, {...init, headers});
}

export function toPagingSortingQueryParams(searchCriteria: SearchCriteria): QueryParams {
    return [
        {parameter: 'pageNo', value: searchCriteria.pageNo.toString()},
        {parameter: 'pageSize', value: searchCriteria.pageSize.toString()},
        ...(
            !!searchCriteria.sortingOption.sort
            && !!searchCriteria.sortingOption.sort.direction
            && !!searchCriteria.sortingOption.sort.fieldName
                ? [
                    {parameter: 'sort', value: searchCriteria.sortingOption.sort.fieldName},
                    {parameter: 'direction', value: searchCriteria.sortingOption.sort.direction}]
                : [])
    ];
}

export function toQueryString(queryParams: QueryParams) {
    return queryParams.map(param => [param.parameter, encodeURIComponent(param.value)].join('=')).join('&');
}
