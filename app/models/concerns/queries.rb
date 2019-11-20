module Queries
  extend ActiveSupport::Concern
  
  module ClassMethods
    def today
      self.for_date(DateTime.now)
    end

    def for_date(d)
      st = d.beginning_of_day
      en = d.end_of_day
      self.where('created_at >= ? AND created_at <= ?', st, en)
    end

    def revenue_for_date(d)
      self.for_date(d).map{|o| o.total_fee}.sum
    end

    def local_only
      self.where(external_id: nil)
    end

    def saved_on_order_system
      self.where.not(external_id: nil)
    end

    def noncanceled
      self.where.not(status: 'canceled')
    end

    def unpaid_alipay
      self.where('transfer_due > 0 AND transfer_due != transfer_received')
    end

  end
end
