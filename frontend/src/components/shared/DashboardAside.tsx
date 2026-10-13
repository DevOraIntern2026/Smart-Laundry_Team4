import { NavLink } from "react-router-dom";
import { X } from "lucide-react";

// Icons
import homeIcon from "../../assets/icons/aside-home-icon.png";
import ordersIcon from "../../assets/icons/aside-orders-icon.png";
import deliveryIcon from "../../assets/icons/aside-delivery-icon.png";
import customersIcon from "../../assets/icons/aside-customers-icon.png";
import servicesIcon from "../../assets/icons/aside-services-icon.png";
import analysisIcon from "../../assets/icons/aside-analysis-icon.png";

const navItems = [
  { label: "الرئيسية", path: "/admin", icon: homeIcon },
  { label: "الطلبات", path: "/admin/orders", icon: ordersIcon },
  { label: "الاستلام والتوصيل", path: "/admin/delivery", icon: deliveryIcon },
  { label: "العملاء", path: "/admin/customers", icon: customersIcon },
  { label: "الخدمات والقطع", path: "/admin/services", icon: servicesIcon },
  { label: "التقارير والتحليلات", path: "/admin/analysis", icon: analysisIcon },
];

type DashboardAsideProps = {
  isOpen: boolean;
  onClose: () => void;
};

export default function DashboardAside({
  isOpen,
  onClose,
}: DashboardAsideProps) {
  return (
    <>
      {isOpen && (
        <button
          type="button"
          className="fixed inset-0 z-40 bg-black/40 lg:hidden"
          onClick={onClose}
        />
      )}
      <aside
        id="admin-navigation"
        className={`fixed inset-y-0 inset-s-0 z-50 flex min-h-screen w-60 flex-col bg-card ps-6 pe-3 py-4 transition-transform duration-200 lg:static lg:z-auto lg:translate-x-0 ${
          isOpen
            ? "translate-x-0"
            : "max-lg:-translate-x-full max-lg:rtl:translate-x-full"
        }`}
      >
        <div className="mb-6 flex items-center justify-between lg:justify-center">
          <NavLink to="/admin">
            <img src="/logo.png" alt="Nivo Logo" />
          </NavLink>
          <button
            type="button"
            className="rounded-md p-2 text-body hover:bg-background lg:hidden"
            onClick={onClose}
          >
            <X size={20} />
          </button>
        </div>

        <nav className="flex-1">
          <ul className="flex flex-col gap-1">
            {navItems.map(({ label, path, icon }) => (
              <li key={path}>
                <NavLink
                  to={path}
                  end={path === "/admin"}
                  onClick={onClose}
                  className={({ isActive }) =>
                    `flex items-center gap-2 rounded-lg p-2 text-sm font-bold transition-colors duration-200 ${
                      isActive
                        ? "bg-accent text-background hover:bg-accent-hover"
                        : "text-[#545454] hover:bg-accent/10"
                    }`
                  }
                >
                  <img src={icon} alt="Icon" className="h-4 w-4" />

                  <span>{label}</span>
                </NavLink>
              </li>
            ))}
          </ul>
        </nav>

        <div className="mt-4 mb-8 p-3">
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-sm font-bold text-primary">
              م
            </div>

            <div>
              <p className=" text-sm font-bold text-heading">م. كريم السعدني</p>
              <p className="mt-1 text-xs text-muted">مشرف العمليات</p>
            </div>
          </div>
        </div>
      </aside>
    </>
  );
}
