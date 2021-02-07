export interface ProductResponse {
    id: string;
    name: string;
    description: string;
    categoryId: string;
    categoryName: string;
    creationDate: string;
    updateDate: string;
    lastPurchasedDate: string;
}

export interface ProductsResponse {
    items: ProductResponse[];
    totalPages: number;
    totalElements: number;
}

export interface Product {
    id: string;
    name: string;
    description: string;
    categoryId: string;
    categoryName: string;
    creationDate: string;
    updateDate: string;
    lastPurchasedDate: string;
}

export interface Products {
    items: Product[];
    totalPages: number;
    totalElements: number;
}

export interface SearchCriteria {
    pageNo: number;
    pageSize: number;
    sortingOption: SortingOption;
}

export interface Sort {
    fieldName: string
    direction: 'ASC' | 'DESC' | null;
}

export interface SortingOption {
    label: string;
    sort: Sort;
}
