import { Outlet } from "react-router-dom";
import DashboardHeader from "../components/shared/DashboardHeader";
import DashboardAside from "../components/shared/DashboardAside";
import Footer from "../components/shared/Footer";

export default function AdminLayout() {
  return (
    <div className="min-h-screen flex">
      <DashboardAside />

      <div className="flex flex-1 flex-col">
        <DashboardHeader />

        <main className="flex-1">
          <Outlet />
        </main>

        <Footer />
      </div>
    </div>
  );
}
