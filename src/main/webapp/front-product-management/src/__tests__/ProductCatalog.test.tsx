import React from 'react';
import {act, cleanup, render, screen, waitFor} from '@testing-library/react';
import ProductCatalog from '../product-catalog/ProductCatalog';
import '@testing-library/jest-dom';
import 'ts-jest';
import {mocked} from 'ts-jest/utils'
import {fetchProducts} from '../api/product-api';
import {someProductsResponse} from './fixtures/ProductsResponseFixtures';


test('renders title and subtitle', () => {
  render(<ProductCatalog/>);
  expect(screen.getByText(/Product Management/i)).toBeInTheDocument();
  expect(screen.getByText(/Simple application/i)).toBeInTheDocument();
});

test('renders pagination', () => {
  render(<ProductCatalog/>);
  expect(screen.getByText(/Previous/i)).toBeInTheDocument();
  expect(screen.getByText(/Next/i)).toBeInTheDocument();
});

test('renders search tools', () => {
  render(<ProductCatalog/>);
  expect(screen.getByText(/20/i)).toBeInTheDocument();
  expect(screen.getByText(/Sort by name \(Z to A\)/i)).toBeInTheDocument();
});

afterEach(() => {
  cleanup();
  jest.resetAllMocks();
});

jest.mock('../api/product-api.ts');

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
