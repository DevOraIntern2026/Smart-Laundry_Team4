import type React from "react";

interface StatCardProps {
  title: string;
  value: string | number;
  subValue?: string;
  badgeText?: string;
  badgeType?: "success" | "info" | "warning";
  icon: React.ReactNode;
  iconBgColor?: string;
  progress?: number;
}

export const StatCard = ({
  title,
  value,
  subValue,
  badgeText,
  badgeType = "success",
  icon,
  iconBgColor,
  progress,
}: StatCardProps) => {
    return(
        <div className="font-tajawal">
           <span className="text-xs text-gray-600">{title}</span> 
           <span className="text-lg font-extrabold">{value}</span>
           <span className="text-xs text-gray-600">{subValue}</span>
           <span>{badgeText}</span>
           <span>{icon}</span>
        </div>
    );
};
