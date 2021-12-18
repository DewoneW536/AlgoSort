//
//  ViewController.swift
//  AlgoSort
//  Created by Dewone Westerfield on 4/13/21.
//

import UIKit

var initialN : Int = 16;
var arrOne = [Int]();
var arrTwo = [Int]();
class ViewController: UIViewController {
    @IBOutlet weak var userChooseArrSize: UISegmentedControl!
    @IBOutlet weak var chooseAlgorithm: UISegmentedControl!
    @IBOutlet weak var chooseSecondAlgorithm: UISegmentedControl!
    @IBOutlet weak var arrOneData : DrawSetOneRectView!
    @IBOutlet weak var arrTwoData : DrawSetTwoRectView!
    
    var getSegmentNGlobally : Int = 0;
    var getAlgoSeg1Globally : Int = 0;
    var getAlgoSeg2Globally : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< initialN{
            arrOne.append(i+1);
        }
        for i in 0 ..< initialN{
            arrTwo.append(i+1);
        }
        arrOne.shuffle();
        arrTwo.shuffle();
        arrOneData.setNeedsDisplay();
        arrTwoData.setNeedsDisplay();
    }
    //In this function, we are basically just going to move the bars around until they are sorted using whichever algorithm is being utilized (kinda challenging to think about how to implement this, also the threading and memory management stuff.
    @IBAction func startSortAnimation(_ sender: UIButton){
        let dispatchQueue = DispatchQueue.global(qos: .background);
        let secondDispatch = DispatchQueue.global(qos: .background);
        
        dispatchQueue.async {
            if(self.getAlgoSeg1Globally == 0){
                arrOne = self.insertionSort(arrOne)
                DispatchQueue.main.async {
                    self.arrOneData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg1Globally == 1){
                arrOne = self.selectionSort(arrOne);
                DispatchQueue.main.async {
                    self.arrOneData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg1Globally == 2){
                self.quickSort(&arrOne, low: 0, high: arrOne.count-1)
                DispatchQueue.main.async {
                    self.arrOneData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg1Globally == 3){
                //arrOne = self.mergeSort(arrOne)
                self.mergeSort(&arrOne,lowIndex: 0,highIndex: arrOne.count-1);
                DispatchQueue.main.async {
                    self.arrOneData.setNeedsDisplay();
                }
            }
        }
        secondDispatch.async {
            if(self.getAlgoSeg2Globally == 0){
                arrTwo = self.insertionSort(arrTwo);
                DispatchQueue.main.async {
                    self.arrTwoData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg2Globally == 1){
                arrTwo = self.selectionSort(arrTwo);
                DispatchQueue.main.async {
                    self.arrTwoData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg2Globally == 2){
                self.quickSort(&arrTwo, low: 0, high: arrTwo.count-1);
                DispatchQueue.main.async {
                    self.arrTwoData.setNeedsDisplay();
                }
            }
            else if(self.getAlgoSeg2Globally == 3){
                self.mergeSort(&arrTwo, lowIndex: 0, highIndex: arrTwo.count-1);
                DispatchQueue.main.async {
                    self.arrTwoData.setNeedsDisplay();
                }
            }
        }
    }
    //don't do anything additional to this, just needed to initialize it so that it can be used in the startSortAnimation function.
    @IBAction func algoSelectedChart1(_ sender: UISegmentedControl) {
        getAlgoSeg1Globally = sender.selectedSegmentIndex;
    }
    //Same thing here - don't touch it.
    @IBAction func algoSelectedChart2(_ sender: UISegmentedControl) {
        getAlgoSeg2Globally = sender.selectedSegmentIndex;
    }
    @IBAction func arrValSelected(_ sender: UISegmentedControl) {
        getSegmentNGlobally = sender.selectedSegmentIndex;
        arrOne = [];
        arrTwo = [];
        if(getSegmentNGlobally == 0){
            initialN = 16;
            for i in 0 ... initialN{
                arrOne.append(i+1);
            }
            for i in 0 ... initialN{
                arrTwo.append(i+1);
            }
            arrOne.shuffle();
            arrTwo.shuffle();
            arrOneData.setNeedsDisplay();
            arrTwoData.setNeedsDisplay();
        }
        if(getSegmentNGlobally == 1){
            initialN = 32;
            for i in 0 ..< initialN{
                arrOne.append(i+1);
            }
            for i in 0 ..< initialN{
                arrTwo.append(i+1);
            }
            arrOne.shuffle();
            arrTwo.shuffle();
            arrOneData.setNeedsDisplay();
            arrTwoData.setNeedsDisplay();
        }
        if(getSegmentNGlobally == 2){
            initialN = 48;
            for i in 0 ..< initialN{
                arrOne.append(i+1);
            }
            for i in 0 ..< initialN{
                arrTwo.append(i+1);
            }
            arrOne.shuffle();
            arrTwo.shuffle();
            arrOneData.setNeedsDisplay();
            arrTwoData.setNeedsDisplay();
            
        }
        if(getSegmentNGlobally == 3){
            initialN = 64;
            for i in 0 ..< initialN{
                arrOne.append(i+1);
            }
            for i in 0 ..< initialN{
                arrTwo.append(i+1);
            }
            arrOne.shuffle();
            arrTwo.shuffle();
            arrOneData.setNeedsDisplay();
            arrTwoData.setNeedsDisplay();
        }
    }
    func insertionSort(_ arr:[Int])->[Int]{
        var arrayI = arr;
        for i in 1 ..< arrayI.count{
            var key : Int = i;
            let temp : Int = arrayI[key];
            while key > 0 && temp < arrayI[key-1] {
                arrayI[key] = arrayI[key-1];
                key -= 1;
            }
            arrayI[key] = temp;
        }
        return arrayI;
    }
    
    func selectionSort(_ arr:[Int])->[Int]{
        var arrS = arr;
        for i in 0 ..< arrS.count-1{
            var low : Int = i;
            for j in i+1 ..< arrS.count{
                if(arrS[j] < arrS[low]){
                    low = j;
                }
            }
            if(i != low){
                arrS.swapAt(i, low);
                //arrOneData.setNeedsDisplay();
            }
        }
        return arrS;
    }
    
    func quickSort(_ arr:inout [Int], low:Int, high:Int){
        if(low < high){
            let part =  partition(&arr, low:low , high:high);
            quickSort(&arr, low: low, high: part-1);
            quickSort(&arr, low: part+1, high: high);
        }
    }
    func partition(_ arr:inout [Int],low: Int,high: Int)->Int{
        let pivot = arr[high];
        var i = low;
        for j in low..<high{
            if(arr[j] <= pivot){
                (arr[i], arr[j]) = (arr[j],arr[i]);
                i += 1;
            }
        }
        //arr.swapAt(i+1, high);
        (arr[i],arr[high]) = (arr[high],arr[i]);
        return i;
    }
    func mergeSort(_ arr:inout [Int], lowIndex:Int,highIndex:Int){
        if(lowIndex >= highIndex){return;}
        let middleIndex = (lowIndex + highIndex)/2;
        mergeSort(&arr, lowIndex: lowIndex, highIndex: middleIndex);
        mergeSort(&arr, lowIndex: middleIndex+1, highIndex: highIndex);
        merge(&arr, lowIndex: lowIndex, middleIndex: middleIndex, highIndex: highIndex);
    }
    func merge(_ arr:inout [Int],lowIndex:Int,middleIndex:Int,highIndex:Int){
        let leftSide = Array(arr[lowIndex...middleIndex]);
        let rightSide = Array(arr[middleIndex+1...highIndex]);
        
        var index = lowIndex;
        var leftIndex = 0;
        var rightIndex = 0;
        
        while leftIndex < leftSide.count && rightIndex < rightSide.count {
            if(leftSide[leftIndex] < rightSide[rightIndex]){
                arr[index] = leftSide[leftIndex];
                leftIndex += 1;
            }
            else{
                arr[index] = rightSide[rightIndex];
                rightIndex += 1;
            }
            index += 1;
        }
        while(leftIndex < leftSide.count){
            arr[index] = leftSide[leftIndex];
            index += 1;
            leftIndex += 1;
        }
        while(rightIndex < rightSide.count){
            arr[index] = rightSide[rightIndex];
            index += 1;
            rightIndex += 1;
        }
    }
    
}
