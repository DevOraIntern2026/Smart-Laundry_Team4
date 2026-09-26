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
import DashboardOverview from "../pages/admin/DashboardOverview";
import OrdersManagement from "../pages/admin/orders/OrdersManagement";
import OrderDetails from "../pages/admin/orders/OrderDetails";
import ServicesManagement from "../pages/admin/services/ServicesManagement";
import AddService from "../pages/admin/services/AddService";
import EditService from "../pages/admin/services/EditService";
import AdminProfile from "../pages/admin/account/AdminProfile";
import Settings from "../pages/admin/Settings";

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
    // It has Aside and DashboardHeader fixed in all pages
    path: "/admin",
    element: <AdminLayout />,
    children: [
      { index: true, element: <DashboardOverview /> },
      { path: "orders", element: <OrdersManagement /> },
      { path: "orders/:orderId", element: <OrderDetails /> },
      { path: "services", element: <ServicesManagement /> },
      { path: "services/add", element: <AddService /> },
      { path: "services/:serviceId/edit", element: <EditService /> },
      { path: "profile", element: <AdminProfile /> },
      { path: "settings", element: <Settings /> },
    ],
  },
]);

export default function AppRouter() {
  return <RouterProvider router={router} />;
}
