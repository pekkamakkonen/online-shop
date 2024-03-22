import { Route, Routes } from 'react-router-dom';
// import './App.css';
import Checkout from './shopping/components/Checkout/Checkout';
import MyAccount from './shopping/components/MyAccount/MyAccount';
import ProductDetail from './shopping/components/ProductDetail/ProductDetail';
import ProductList from './shopping/components/ProductList/ProductList';
import ShoppingCart from './shopping/components/ShoppingCart/ShoppingCart';

function App() {
  return (
    <>
      <h1>Online Shop</h1>
      <Routes>
        <Route path="/" element={<ProductList />} />
        <Route path="/checkout" element={<Checkout />} />
        <Route path="/my-account" element={<MyAccount />} />
        <Route path="/product/:id" element={<ProductDetail />} />
        <Route path="/cart" element={<ShoppingCart />} />
      </Routes>
    </>
  );
}

export default App;
