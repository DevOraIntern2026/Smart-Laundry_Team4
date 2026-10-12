import { createBrowserRouter, RouterProvider } from "react-router-dom";

// Layouts
import MainLayout from "./MainLayout";
import AdminLayout from "./AdminLayout";

// Customer pages
import Home from "../pages/customer/Home";
import Login from "../pages/customer/account/Login";
import SignUp from "../pages/customer/account/SignUp";
import CustomerProfile from "../pages/customer/account/CustomerProfile";
import EditProfile from "../pages/customer/account/EditProfile";
import Services from "../pages/customer/services/Services";
import ServiceDetails from "../pages/customer/services/ServiceDetails";
import OrderSummary from "../pages/customer/orders/OrderSummary";
import PickupScheduling from "../pages/customer/orders/PickupScheduling";
import OrderConfirmation from "../pages/customer/orders/OrderConfirmation";
import OrderTracking from "../pages/customer/orders/OrderTracking";

// Admin pages
import AdminLogin from "../pages/admin/account/AdminLogin";
import OrderDetails from "../pages/admin/orders/OrderDetails";
import Analysis from "../pages/admin/Analysis";
import DashboardHome from "../pages/admin/DashboardHome";
import Delivery from "../pages/admin/Delivery";
import LaundryItems from "../pages/admin/services/LaundryItems";
import Orders from "../pages/admin/orders/Orders";
import Customers from "../pages/admin/customers/Customers";
import CustomerDetails from "../pages/admin/customers/CustomerDetails";

const router = createBrowserRouter([
  // login and register are separated outside the layouts to appear without any fixed components like Header, Footer or Aside in main layout or in dashboard
  { path: "/login", element: <Login /> },
  { path: "/signup", element: <SignUp /> },
  { path: "/admin/login", element: <AdminLogin /> },

  {
    // Main layout for all the project pages except admin dashboard pages.
    // It has Header and Footer components fixed in all pages.
    element: <MainLayout />,
    children: [
      { path: "/", element: <Home /> },
      { path: "/profile", element: <CustomerProfile /> },
      { path: "/profile/edit", element: <EditProfile /> },
      { path: "/services", element: <Services /> },
      { path: "/services/:serviceId", element: <ServiceDetails /> },
      { path: "/orders/summary", element: <OrderSummary /> },
      { path: "/orders/scheduling", element: <PickupScheduling /> },
      { path: "/orders/confirmation", element: <OrderConfirmation /> },
      { path: "/orders/:orderId/tracking", element: <OrderTracking /> },
    ],
  },
  {
    // Admin layout for all dashboard pages
    // It has Aside and DashboardHeader and Footer fixed in all pages
    path: "/admin",
    element: <AdminLayout />,
    children: [
      { index: true, element: <DashboardHome /> },

      { path: "services", element: <Services /> },
      { path: "services/items", element: <LaundryItems /> },

      { path: "orders", element: <Orders /> },
      { path: "orders/:orderId", element: <OrderDetails /> },

      { path: "customers", element: <Customers /> },
      { path: "customers/:customerId", element: <CustomerDetails /> },

      { path: "delivery", element: <Delivery /> },
      { path: "analysis", element: <Analysis /> },
    ],
  },
]);

export default function AppRouter() {
  return <RouterProvider router={router} />;
}
