import { Outlet } from "react-router-dom";
import DashboardHeader from "../components/shared/DashboardHeader";
import DashboardAside from "../components/shared/DashboardAside";

export default function AdminLayout() {
  return (
    <div className="min-h-screen flex">
      <DashboardAside />

      <div>
        <DashboardHeader />

        <main>
          <Outlet />
        </main>
      </div>
    </div>
  );
}
