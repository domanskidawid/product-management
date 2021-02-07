import {ProductsResponse} from '../../api';

export const someProductsResponse = (): ProductsResponse => {
    return {
        items: [
            {
                id: '1',
                name: 'hammer',
                description: 'blue hammer',
                categoryId: '1',
                categoryName: 'tools',
                creationDate: '2020-09-19T22:01:00Z',
                updateDate: '2020-09-19T22:01:00Z',
                lastPurchasedDate: '2020-09-19T22:01:00Z'
            }
        ],
        totalPages: 1,
        totalElements: 1
    }
}
