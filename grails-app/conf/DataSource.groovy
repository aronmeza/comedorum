dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "admin"
    dbCreate = "update"//"create-drop"
    url = 'jdbc:postgresql:comedorum'
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    show_sql = true
}
// environment specific settings
environments {
    development {
        dataSource {
           dbCreate = "update"//"create-drop"
            url = "jdbc:postgresql:comedorum"
        }
    }
    test {
        dataSource {
        	dbCreate = "update"//"create-drop"
            url = "jdbc:postgresql:comedorum"
        }
    }
    production {
        dataSource {
            dbCreate = "update"//"create-drop"
            url = "jdbc:postgresql:comedorum"
        }
	hibernate{
	   show_sql = false
	}
    }
}
