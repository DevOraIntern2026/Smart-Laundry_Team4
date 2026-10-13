import { StatCard } from "../../../components/shared/StatCard";
import  AsideServicesIcon  from '../../../assets/icons/aside-services-icon.png'
export default function AdminServices() {
  return (
    <div className="bg-background min-h-screen font-tajawal py-[12px] pl-[25px] pr-[20px]">
      {/* title & description       */}
      <div className="max-w-[428px]">
        <h1 className="text-lg font-bold">إدارة كتالوج الخدمات التشغيلية </h1>
        <p className="text-sm text-gray-600">
          التحكم في خدمات الغسيل، أوقات المعالجة، الطاقة الاستيعابية، والتفعيل
          الفوري لجميع منافذ الخدمة والتطبيق.
        </p>
      </div>
      {/* Statistics cards */}
      <div>
        <StatCard title="الخدمات المفعلة" value="8" icon={<img src={AsideServicesIcon} alt="Services" />} />
      </div>
    </div>
  );
}
