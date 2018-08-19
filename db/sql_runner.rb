class SqlRunner

  def self.run(sql, values = [])
    db = PG.connect({dbname: 'cinema', hostname: 'localhost'})
    db.prepare("input", sql)
    result = db.exec_prepared("input", values)
    db.close() if db != nil
    return result
  end

end
