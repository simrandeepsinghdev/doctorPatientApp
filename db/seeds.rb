# db/seeds.rb

# Create Receptionist
receptionist = User.find_or_create_by!(email: "receptionist@example.com") do |user|
  user.name = "Palak"
  user.password = "password"
  user.role = "receptionist"
  puts "Created Receptionist: #{user.name}"
end

doctor = User.find_or_create_by!(email: "doctor@example.com") do |user|
  user.name = "Dr. Smith"
  user.password = "password"
  user.role = "doctor"
  puts "Created Doctor: #{user.name}"
end

patients = 5.times.map do |i|
  Patient.find_or_create_by!(name: "Patient #{i + 1}") do |patient|
    patient.age = rand(20..60)
    patient.contact = "123456789#{i}"  
    patient.address = "123 Example Street, City #{i + 1}"
    puts "Created Patient: #{patient.name}"
  end
end

patients.each do |patient|
  Appointment.find_or_create_by!(patient: patient, doctor: doctor) do |appointment|
    appointment.date = DateTime.now - rand(1..10).days
    puts "Created Appointment for Patient: #{patient.name} with Doctor: #{doctor.name}"
  end
end
