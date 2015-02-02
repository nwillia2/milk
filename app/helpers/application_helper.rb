module ApplicationHelper
  def format_date(dateStr, format = 'datetime')
      if dateStr.present? && (dateStr.is_a? String)      
        date = DateTime.parse(dateStr)
      else
        # assume it's already a date
        date = dateStr
      end
      if date.present?
        return case format
           when "short" then date.strftime("%d/%m/%Y").titlecase
           when "long" then  date.strftime("%d %B %Y").titlecase
           when "monthyear" then  date.strftime("%b %Y").titlecase
           when "datetime" then date.strftime("%d %B %Y %T").titlecase
           when "shortdatetime" then date.strftime("%d/%m/%Y %T").titlecase
           when "time" then date.strftime("%H:%M").titlecase
        end           
      else
        return t('common.notSet')
      end        
    end
end
