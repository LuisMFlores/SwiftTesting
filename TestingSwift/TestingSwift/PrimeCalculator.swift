//
//  PrimeCalculator.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

struct PrimeCalculator {
    static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) {
        DispatchQueue.global().async {
            guard max > 1 else { return }
            var sieve = [Bool](repeating: true, count: max)
            sieve[0] = false
            sieve[1] = false
            
            for number in 2..<max {
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[multiple] = false
                    }
                }
            }
            
            let primes = sieve.enumerated().compactMap {
                $1 == true ? $0 : nil
            }
            completion(primes)
        }
    }
    
    static func calculateStreaming(upTo max: Int, completion: @escaping (Int) -> Void) {
        DispatchQueue.global().async {
            guard max > 1 else { return }
            var sieve = [Bool](repeating: true, count: max)
            sieve[0] = false
            sieve[1] = false
            
            for number in 2..<max {
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[multiple] = false
                    }
                    completion(number)
                }
            }
        }
    }
    
    static func print(upTo max: Int, completion: @escaping (Int) -> Void) {
        (1...max).forEach {
            completion($0)
        }
    }
}
