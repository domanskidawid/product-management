import React from 'react';
import {act, cleanup, render, screen, waitFor} from '@testing-library/react';
import ProductCatalog from '../ProductCatalog';
import '@testing-library/jest-dom';
import 'ts-jest';
import {mocked} from 'ts-jest/utils'
import {fetchProducts} from '../../api/product-api';
import {someProductsResponse} from '../../fixtures/ProductsResponseFixtures';

afterEach(() => {
  cleanup();
  jest.resetAllMocks();
});

jest.mock('../../api/product-api.ts');

const mockedFetchProducts = mocked(fetchProducts);

test('Renders a product correctly', async () => {
  mockedFetchProducts.mockImplementationOnce(() => Promise.resolve(someProductsResponse()));

  await act(async () => {
    const {getByText} = render(<ProductCatalog/>);
    await waitFor(() => [
      expect(getByText('blue hammer')).toBeTruthy(),
      expect(getByText('tools')).toBeTruthy(),
      expect(getByText('Add to basket')).toBeTruthy(),
    ]);
  });
});

test('renders title and subtitle', async () => {
  mockedFetchProducts.mockImplementationOnce(() => Promise.resolve(someProductsResponse()));
  await act(async () => {
    render(<ProductCatalog/>);
    await waitFor(() => [
      expect(screen.getByText(/Product Management/i)).toBeInTheDocument(),
      expect(screen.getByText(/Simple application/i)).toBeInTheDocument()
    ]);
  });
});

test('renders pagination', async () => {
  mockedFetchProducts.mockImplementationOnce(() => Promise.resolve(someProductsResponse()));
  await act(async () => {
    render(<ProductCatalog/>);
    await waitFor(() => [
      expect(screen.getByText(/Previous/i)).toBeInTheDocument(),
      expect(screen.getByText(/Next/i)).toBeInTheDocument()
    ])
  });
});

test('renders search tools', async () => {
  mockedFetchProducts.mockImplementationOnce(() => Promise.resolve(someProductsResponse()));
  await act(async () => {

    render(<ProductCatalog/>);
    await waitFor(() => [
      expect(screen.getByText(/20/i)).toBeInTheDocument(),
      expect(screen.getByText(/Sort by name \(Z to A\)/i)).toBeInTheDocument()
    ]);
  });
});
