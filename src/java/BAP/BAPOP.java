package BAP;

import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pavankumar
 */
public class BAPOP {
    public List<Integer> getLabDetails(int[][] todayclasses,int StaffID){
        List<Integer> labdetails=new ArrayList<Integer>();
        labdetails.add(0);
        int c=1;
        for (int i = 1; i < todayclasses[0].length; i++) {
            if(todayclasses[0][i]!=todayclasses[1][i]){
                if(todayclasses[0][i]==StaffID){
                    labdetails.add(i);
                    labdetails.set(0,todayclasses[0][0]);
                }
                if(todayclasses[1][i]==StaffID){
                    labdetails.add(i);
                    labdetails.set(0,todayclasses[1][0]);
                }
            }
        }
        return labdetails;
    }
    public List<Integer> getLabPeriods(int[][] todayclasses){
        List<Integer> labdetails=new ArrayList<Integer>();
        int c=1;
        for (int i = 1; i < todayclasses[0].length; i++) {
            if(todayclasses[0][i]!=todayclasses[1][i]){
                    labdetails.add(i);
            }
        }
        return labdetails;
    }
}
