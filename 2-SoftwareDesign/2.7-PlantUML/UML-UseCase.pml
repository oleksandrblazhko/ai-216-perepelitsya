@startuml

title Usecase Diagram

left to right direction

actor Teenager

rectangle Software {

    usecase (pay for the order)
    usecase (authorization)

   :Teenager: -- (pay for the order)
   :Teenager: -- (authorization)
   (pay for the order) .> (authorization) : include
}

@enduml
