::CLINICAL_SETTINGS = {:snf => {:name => 'Skilled Nursing Facility'},
                       :op => {:name => 'Outpatient'},
                       :ip => {:name => 'Inpatient'},
                       :acute => {:name => 'Acute Care'},
                       :alf => {:name => 'Assisted Living Facility'},
                       :ccrc => {:name => 'Continuing Care Retirement Center'},
                       :hh => {:name => 'Home Health'}
}
::TITLES = {:pt => {:name => 'Physical Therapist'},
            :pta => {:name => 'Physical Therapy Assistant'},
            :ot => {:name => 'Occupational Therapist'},
            :cota => {:name => 'Certified Occupational Therapy Assistant'},
            :slp => {:name => 'Speech Language Pathologist'}
}

def setting_codes
  CLINICAL_SETTINGS.map{ |k,v| k }
end

def title_codes
  TITLES.map{ |k,v| k }
end