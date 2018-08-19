require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'cinema', host: 'localhost'})
      db.prepare("input", sql)
      result = db.exec_prepared("input", values)
    ensure
      db.close() if db != nil
    end
      return result
  end

end
